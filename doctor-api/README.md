## Local Doctor Finder
Javascript API practice using BetterDoctor

### Prerequisites
* ES6 compatible browser such as Chrome or Safari
* NPM
* Bower

### Setup
These instructions have been verified to work on MacOS. This is an unpublished page but the following instructions generate a browser preview. Each instruction formatted `like this` should be typed verbatim or copy/pasted.
  * Get BetterDoctor API key at https://developer.betterdoctor.com/signup
  * Open terminal
  * `cd desktop`
  * `git clone https://github.com/sushadore/doctors.git`
  * `cd doctors`
  * `touch .env`
  * `atom .`
  * Add `exports.apiKey="`your BetterDoctor API key here`"` to the .env file
  * Add `.env` to the .gitignore file
  * `bower install`
  * `npm install`
  * `gulp serve`

The required packages may take a few minutes to download and install based on individual computer and internet connection. The last command should launch the app preview in your browser.

### Technologies
HTML, CSS/SCSS, Bootstrap, ES6, Jquery, Node, Bower

### Author
Susha Dore

### Legal
MIT License

Copyright (c) 2017 Susha Dore

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
