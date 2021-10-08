# profile_secrets

![pdk-validate](https://github.com/ncsa/puppet-profile_secrets/workflows/pdk-validate/badge.svg)
![yamllint](https://github.com/ncsa/puppet-profile_secrets/workflows/yamllint/badge.svg)

NCSA Common Puppet Profiles - configure Hashicorp Vault for use with puppet

## Usage

To install and configure:

```
  include profile_secrets
```

## Configuration

The following parameters need to be set in hiera:
```
profile_secrets::enable: true
profile_secrets::vault_authmethod: "example_authmethod"
profile_secrets::vault_secret_engine: "example_secret_engine"
profile_secrets::vault_url: "https://asd-vault1.internal.ncsa.edu:8200/v1/"
```

## Dependencies
- [southalc/vault](https://forge.puppet.com/modules/southalc/vault)

## Reference

[REFERENCE.md](REFERENCE.md)

