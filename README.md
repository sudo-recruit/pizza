# Pizza

> Chef cookbook and Packer configuration to build Ruby on Rails project in Sudo, inherited from [Pita](https://github.com/sudo-recruit/pita) project

This project contains two parts: **Packer configuration** and **cookbook named Pizza**.

For Pizza cookbook, please read [this file](pizza/README.md).

## Requirements

* ruby 2.3.x
* [packer](https://www.packer.io/) v0.10.x

## Usage

### Install Dependencies

In the root directory of project.

```shell
$ cd pizza
$ gem install bundler
$ bundle
```

### Prepare `variables.json`

In the root directory of project.

```shell
$ cp variables.json variables.local.json
$ $EDITOR variables.local.json
```

### Run Tasks

We strongly recommend you to run tasks with `rake`.

Rake task | Description
--- | ---
`rake berks` | Download dependency cookbooks with Berkshelf.
`rake base_ami` | Create base image to accelerate building process.
`rake ami` | Create AMI with application.
`rake ami_ci` | Create AMI in CI service. It would come with application without assets. Variables would be injected with environment variables.

## License

MIT
