# cddemo-base-cookbook

Setup base stuff for the CD Demo VM

## Supported Platforms
supports 'Debian', '>= 7.5'

## Attributes

## Usage

### cddemo-base::default

Include `cddemo-base` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[cddemo-base::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Alexander Birk (birk@pingworks.de)
