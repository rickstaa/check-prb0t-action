# Check PRB0t action <!-- omit in toc -->

Simple GitHub action that can be used to check whether a PR was created using the [PRB0t](https://github.com/PRB0t/PRB0t) PR anonymiser.

- [Check PRB0t action](#check-prb0t-action)
  - [QuickStart](#quickstart)
  - [Inputs](#inputs)
  - [Outputs](#outputs)
    - [`used_prb0t`](#used_prb0t)
  - [Environment variables](#environment-variables)
    - [`USED_PRBOT`](#used_prbot)
  - [Use-cases](#use-cases)
    - [Automatically close pull requests](#automatically-close-pull-requests)
      - [Close if used](#close-if-used)
      - [Close if not used](#close-if-not-used)
  - [Contributing](#contributing)

## QuickStart

```yml
name: PRB0t check action
on: [pull_request]

jobs:
  prB0t_check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      # Check whether PRB0T was used.
      - uses: rickstaa/check-prb0t-action@v1
        id: prb0t_check

      # Print the result using the env variable.
      - run: |
          echo "PRB0t used: ${{ env.USED_PRB0T }}"

      # Print the result using the action output.
      - run: |
          echo "PRB0t used: ${{ steps.prb0t_check.outputs.used_prb0t }}"
```

## Inputs

This action does not yet have any inputs.

## Outputs

### `used_prb0t`

Boolean specifying whether the PR was created using [PRB0t](https://github.com/PRB0t/PRB0t).

## Environment variables

### `USED_PRBOT`

Boolean specifying whether the PR was created using [PRB0t](https://github.com/PRB0t/PRB0t).

## Use-cases

### Automatically close pull requests

You can use this action with the [actions/close-pull-request](https://github.com/marketplace/actions/close-pull-request) to automatically close pull request based on the condition returned by this action.

#### Close if used

For some repositories, you want to discourage people from committing anonymously. If that is the case you can use the following GitHub action workflow:

```yml
name: PRB0t PR close action
on: [pull_request]

jobs:
  prB0tClose:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      # Check whether PRB0T was used.
      - uses: rickstaa/check-prb0t-action@v1
        id: prb0t_check

      # Close PRs that used PRB0t.
      - if: ${{ env.USED_PRB0T == 'true' }}
        uses: superbrothers/close-pull-request@v3
        with:
          # Optional. Post an issue comment just before closing a pull request.
          comment: "We do not accept anonymous PRs. If you have any questions, please feel free to contact us."
```

#### Close if not used

You might only want to accept anonymous pull requests for other repositories to protect your contributors. If that is the case, you can use the following GitHub action workflow:

```yml
name: PRB0t PR close action
on: [pull_request]

jobs:
  prB0tClose:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      # Check whether PRB0T was used.
      - uses: rickstaa/check-prb0t-action@v1
        id: prb0t_check

      # Close PRs that used PRB0t.
      - if: ${{ env.USED_PRB0T == 'false' }}
        uses: superbrothers/close-pull-request@v3
        with:
          # Optional. Post a issue comment just before closing a pull request.
          comment: "We only accept anonymous PRs. Please use [PRB0t](https://github.com/PRB0t/PRB0t) for creating your PR."
```

## Contributing

Feel free to open an issue if you have ideas on how to make this GitHub action better or if you want to report a bug! All contributions are welcome. :rocket: Please consult the [contribution guidelines](CONTRIBUTING.md) for more information.
