# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
```
> ruby -v
ruby 2.4.5p335 (2018-10-18 revision 65137) [x86_64-darwin17]
```
* Rails version
```
> rails -v
Rails 5.2.1.1

```
* Bundler version
```
> bundle -v
Bundler version 1.16.6
```
* Configuration
```
> bundle install
```
* Linter
```
> rubocop
```
* How to run the test suite


* Testing the API end-point for People:
```
> curl -H "Authorization: Bearer API_KEY" "https://api.salesloft.com/v2/people.json"

```
* People response with paging info
```
> curl -H "Authorization: Bearer API_KEY" "https://api.salesloft.com/v2/people.json?page=1&per_page=25&include_paging_counts=true"
```
