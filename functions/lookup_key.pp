# @summary Lookup key value from vault using KV Secrets Engine - Version 2 (API)
#
# @param key
#   Key whose value you are looking up
#
# @param secrets_directory
#   Directory in Vault secrets engine to find the key
#
# @param default_value
#   Fallback value to default to if secrets not enabled
#
# @example
#   $secret_value = Deferred('::profile_secrets::lookup_key', [ $key, Optional $secrets_directory, Optional $default_value ] )
#
function profile_secrets::lookup_key(
  String $key,
  Optional[String] $secrets_directory = undef,
  Optional[String] $default_value = undef,
) >> String {

  $enabled = lookup('profile_secrets::enable', Boolean)
  if ( $enabled ) {
    $vault_api_prefix     = lookup('profile_secrets::vault_api_prefix', String)
    $vault_authmethod     = lookup('profile_secrets::vault_authmethod', String)
    $vault_base_url       = lookup('profile_secrets::vault_base_url', String)
    $vault_secrets_engine = lookup('profile_secrets::vault_secrets_engine', String)
    $vault_kv_version = lookup('profile_secrets::vault_kv_version', String)

    # IF ANY profile_secrets::vault_* PARAMETERS ARE EMPTY NOTIFY AND ERROR
    if ( empty($vault_authmethod)
      or empty($vault_api_prefix)
      or empty($vault_base_url)
      or empty($vault_secrets_engine)
      or empty($vault_kv_version)
    ) {
      $notify_text = @("EOT"/)
        ERROR: \$profile_secrets::enable is true but one or more of the following required paramets are not set:
          - \$profile_secrets::vault_api_prefix
          - \$profile_secrets::vault_authmethod
          - \$profile_secrets::vault_base_url
          - \$profile_secrets::vault_secrets_engine
          - \$profile_secrets::vault_kv_version
        Each of the above must be set if \$profile_secrets is enabled.
        | EOT
      notify { $notify_text:
        withpath => true,
      }
      $return_value = 'ERROR'
    } elsif $vault_kv_version == 'v2' {
      # BUILD $vault_uri FROM PARAMETERS
      $vault_uri = "${vault_base_url}/${vault_api_prefix}/${vault_secrets_engine}/data/${secrets_directory}"
      notify {$vault_uri:
        withpath => true,
      }
      $return_value = vault_key($vault_uri, $vault_authmethod, $key, $vault_kv_version)
    } elsif $vault_kv_version == 'v1' {
      $vault_uri = "${vault_base_url}/${vault_api_prefix}/${vault_secrets_engine}/${secrets_directory}"
      notify {$vault_uri:
        withpath => true,
      }
      $return_value = vault_key($vault_uri, $vault_authmethod, $key)
    } else {
      $notify_text = @("EOT"/)
      ERROR: \$vault_kv_version is set incorrectly
      | EOT
      notify { $notify_text:
        withpath => true,
      }
      $return_value = 'ERROR'
      }
  } else {
    # IF $default_value IS EMPTY NOTIFY AND ERROR
    if ( empty($default_value) ) {
      $notify_text = @("EOT"/)
        ERROR: \$profile_secrets::enable is not enabled, but no \$default_value was supplied to this function call. 
        If \$profile_secrets::enable is disabled, you must supply a \$default_value was supplied to this function call."
        | EOT
      notify { $notify_text:
        withpath => true,
      }
      $return_value = 'ERROR'
    } else {
      $return_value = $default_value
    }
  }

  $return_value

}
