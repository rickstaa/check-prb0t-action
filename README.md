# Check PRB0t action

Simple GitHub action that can be used to check whether a PR was created using the 
[PRB0t](https://github.com/PRB0t/PRB0t) PR anonymiser.

## QuickStart

```yml
name: PRB0t check action
on: [pull_request]
jobs:
  prB0t_check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      # Check whether PRB0T was used
      - uses: rickstaa/used_prb0t_action@v1
        id: prb0t_check

      # Print results
      - run:
          echo "PRB0t used: ${{ steps.tests.outputs.used_prb0t }}"
```

## Inputs

This action does not yet have any inputs.

## Outputs

### `used_prb0t`

Boolean specifying whether the PR was created using [PRB0t](https://github.com/PRB0t/PRB0t).

## Environment variables

### USED_PRBOT

Boolean specifying whether the PR was created using [PRB0t](https://github.com/PRB0t/PRB0t).

## Contributing

Feel free to open an issue if you have ideas on how to make this GitHub action better or if you want to report a bug! All contributions are welcome. :rocket: Please consult the [contribution guidelines](CONTRIBUTING.md) for more information.
