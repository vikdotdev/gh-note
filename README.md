# gh-note
An opinionated way of working with gists for note-taking.

## Installation
Requires Ruby and Bundler to be installed. Bundler comes by default starting from ruby 2.6.
```
gh extension install https://github.com/vikdotdev/gh-note
```

## Things to do
- Make folder for keeping local copies configurable.
- Add `delete` command.
- Add `status` command.
- Add `--verbose` option to some commands.
- Add `--all` option to `push`, `edit` and `view` commands. Paginate results.
- Add automatic less paging support for `view` command.
- Colorize `view` command file contents.
- Clean up `main.rb` require code.

## Notes
This might be useful to fetch token from `gh`:
```
gh config get -h github.com oauth_token
```
