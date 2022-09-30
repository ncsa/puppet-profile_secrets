# profile_secrets
This profile is no longer maintained. Please use https://wiki.ncsa.illinois.edu/display/PUPPET/Encrypting+Puppet+hiera+with+eyaml.


![pdk-validate](https://github.com/ncsa/puppet-profile_secrets/workflows/pdk-validate/badge.svg)
![yamllint](https://github.com/ncsa/puppet-profile_secrets/workflows/yamllint/badge.svg)

NCSA Common Puppet Profiles - configure Hashicorp Vault for supplying secrets into puppet

## Usage

To install and configure:

```puppet
include profile_secrets
```
Instructions for how to put secrets and setup authentication in Vault are located here:
https://wiki.ncsa.illinois.edu/display/PUPPET/Using+Vault+for+Serving+Sensitive+Data

Since Deferred functions cannot do hiera lookups and can only use ruby compiled functions, this
module is used to generate the Vault URI and create reference for looking up common vault variables
for various profiles. The best way to use this is to pull the hiera lookup variables into local variables
and then feed them into the deferred function. 

The only variable the lookup\_uri function requires is the directory where the Vault secret is located.

You will need to set the key name for the secret within the profile. 

To use the `profile_secrets::lookup_uri` function to fetch the Vault URI:

```puppet
$vault_uri = profile_secrets::lookup_uri($vaultsecretdir)
$vault_auth = lookup(profile_secrets::vault_authmethod)
$vault_kv_version = lookup(profile_secrets::vault_kv_version)
$vaultcreatehostkeytab = Deferred('vault_key',[$vault_uri,$vault_auth,$vaultkeytabkey,$vault_kv_version])

```

## Configuration

The following parameters need to be set in hiera:
```
profile_secrets::enable: true
profile_secrets::vault_api_prefix: "v1"
profile_secrets::vault_authmethod: "example_authmethod"
profile_secrets::vault_base_url: "https://asd-vault1.internal.ncsa.edu:8200"
profile_secrets::vault_secrets_engine: "example_secrets_engine"
profile_secrets::vault_kv_version: "v2"
```

## Dependencies
- [southalc/vault](https://forge.puppet.com/modules/southalc/vault)

## Reference

[REFERENCE.md](REFERENCE.md)

