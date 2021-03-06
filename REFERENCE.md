# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`profile_secrets`](#profile_secrets): Configure HashiCorp Vault for lookup of secrets in Puppet

### Functions

* [`profile_secrets::lookup_uri`](#profile_secretslookup_key): Generate the URI for Vault secret lookups

## Classes

### <a name="profile_secrets"></a>`profile_secrets`

Configure HashiCorp Vault for lookup of secrets in Puppet

#### Examples

##### 

```puppet
include profile_secrets
```

#### Parameters

The following parameters are available in the `profile_secrets` class:

* [`enable`](#enable)
* [`vault_api_prefix`](#vault_api_prefix)
* [`vault_authmethod`](#vault_authmethod)
* [`vault_base_url`](#vault_base_url)
* [`vault_secrets_engine`](#vault_secrets_engine)
* [`vault_kv_version`](#vault_kv_version)

##### <a name="enable"></a>`enable`

Data type: `Boolean`

State of whether vault lookups are enabled

##### <a name="vault_api_prefix"></a>`vault_api_prefix`

Data type: `String`

name of vault api prefix to use in uri

##### <a name="vault_authmethod"></a>`vault_authmethod`

Data type: `String`

name of vault authmethod to use

##### <a name="vault_base_url"></a>`vault_base_url`

Data type: `String`

base url of vault server

##### <a name="vault_secrets_engine"></a>`vault_secrets_engine`

Data type: `String`

name of vault secret engine to use

##### <a name="vault_kv_version"></a>`vault_kv_version`

Data type: `String`

version of vault secret engine to use v1/v2

## Functions

#### `profile_secrets::lookup_uri(Optional[String] $secrets_directory = undef)`

The profile_secrets::lookup_uri function. 

Returns: `String`

#### Examples

##### 

```puppet
$vault_uri = lookup_uri([$key])

$vault_uri = profile_secrets::lookup_uri($vaultsecretdir)
$vault_auth = lookup(profile_secrets::vault_authmethod)
$vault_kv_version = lookup(profile_secrets::vault_kv_version)

$vaultcreatehostkeytab = Deferred('vault_key',[$vault_uri,$vault_auth,$vaultkeytabkey,$vault_kv_version])

```



