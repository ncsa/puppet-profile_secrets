# @summary Configure HashiCorp Vault for lookup of secrets in Puppet
#
# @param enable
#   State of whether vault lookups are enabled
#
# @param vault_api_prefix
#   name of vault api prefix to use in uri
#
# @param vault_authmethod
#   name of vault authmethod to use
#
# @param vault_base_url
#   base url of vault server
#
# @param vault_secrets_engine
#   name of vault secret engine to use
#
# @example
#   include profile_secrets
#
class profile_secrets (
  Boolean $enable,
  String  $vault_api_prefix,     # NOT CURRENTLY USED IN CLASS BUT USED FOR LOOKUPS
  String  $vault_authmethod,     # NOT CURRENTLY USED IN CLASS BUT USED FOR LOOKUPS
  String  $vault_base_url,       # NOT CURRENTLY USED IN CLASS BUT USED FOR LOOKUPS
  String  $vault_secrets_engine, # NOT CURRENTLY USED IN CLASS BUT USED FOR LOOKUPS
  String  $vault_kv_version, # NOT CURRENTLY USED IN CLASS BUT USED FOR LOOKUPS
) {

  #if ( $enable ) {
  #  include vault_secrets::vault_key
  #}

}
