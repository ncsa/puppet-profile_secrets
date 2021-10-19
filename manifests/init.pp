# @summary Configure HashiCorp Vault for lookup of secrets in Puppet
#
# @param enable
#   State of whether vault lookups are enabled
#
# @param vault_authmethod
#   name of vault authmethod to use
#
# @param vault_secret_engine
#   name of vault secret engine to use
#
# @param vault_url
#   base url and version of vault server
#
# @example
#   include profile_secrets
class profile_secrets (
  Boolean $enable,
  String  $vault_authmethod, # NOT CURRENTLY USED IN CLASS BUT USED FOR LOOKUPS
  String  $vault_secret_engine, # NOT CURRENTLY USED IN CLASS BUT USED FOR LOOKUPS
  String  $vault_url, # NOT CURRENTLY USED IN CLASS BUT USED FOR LOOKUPS
) {

  if ( $enable ) {
    include ::vault
  }

}
