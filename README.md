
## Indonesian Calculator
[Live Demo](https://indonesiancalculator.herokuapp.com/)

Simple web app that performs a basic math operation expressed in
words, and return the result in words. For example... &quot;dua tambah dua&quot; would return &quot;dua tambah dua adalah empat&quot; &quot;dua kurang satu&quot; would return &quot;dua kurang satu adalah satu&quot;

---

### How to run
```sh
$ git clone {this repository}
$ cd IndonesianCalculator
$ bundle install --without production
$ rails s
```

### Run test
```sh
$ rake test TESTOPTS="-v"
```
### How to use
- Operator: tambah, kurang, bagi, kali, pangkat
- Number 0 - 9999
- Example : dua tambah dua, lima kali dua, dua kurang satu

#### Dependency
* Ruby version: ruby 2.3.3p222
* Rails version: Rails 5.1.5