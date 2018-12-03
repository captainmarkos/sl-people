# SalesLoft Code Challenges

This app fulfills the following code challenges:

*`Level 1`*: Show a list of People records that are available via the API.  Display each Person’s name, email address, and job title.

*`Level 2`*: Create a button that, when clicked, displays a frequency count of all the unique characters in all the email addresses of all the People you have access to, sorted by frequency count (the count below).

For example, if there was only 1 Person record returned by the API with the email address “jimmy_mcmahon@salesloft.com”, it would show a frequency breakdown that looks like:
```
Character Count
    m       5
    o       3
    j       1
    ...     ...
```

*`Level 3`*:  Create a 2nd button that would show us a list of suggested possible duplicate People.  A human can tell that “benoliv@salesloft.com” and “benolive@salesloft.com” are very likely the same person with just one of the email addresses having a typo.  However we would like you to decide what might constitute a duplicate - up to you.

See documentation [SalesLoft_Engineering_Offline_Exercise_v3.pdf](https://github.com/captainmarkos/sl-people/blob/master/SalesLoft_Engineering_Offline_Exercise_v3.pdf)

Note: The frequency table is incorrect in this (original) document.

### Ruby version

```
> ruby -v
ruby 2.4.5p335 (2018-10-18 revision 65137) [x86_64-darwin17]
```
### Rails version

```
> rails -v
Rails 5.2.1.1
```
### Configuration

```
> bundle install
> cp .env.example .env
```
Add the appropriate API key to `.env`

### Run the app
```
> rails server
```
Hit the front-end with: `http://0.0.0.0:3000/people`

### Screenshots
[Level 1 - People List](https://raw.githubusercontent.com/captainmarkos/sl-people/master/app/assets/images/People_List_Level_1.png)

[Level 2 - Character Frequencies](https://raw.githubusercontent.com/captainmarkos/sl-people/master/app/assets/images/Character_Frequencies_Level_2.png)

[Level 3 - Possible Duplicate Detection](https://raw.githubusercontent.com/captainmarkos/sl-people/master/app/assets/images/Possible_Dups_Level_3.png)

### Linter
```
> rubocop
```

### Testing the API end-point for People with curl:
```
> curl -H "Authorization: Bearer API_KEY" "https://api.salesloft.com/v2/people.json"

```
### People response with paging info
```
> curl -H "Authorization: Bearer API_KEY" "https://api.salesloft.com/v2/people.json?page=1&per_page=25&include_paging_counts=true"
```
