# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "flowbite", to: "https://ga.jspm.io/npm:flowbite@1.5.1/dist/flowbite.js"
pin "dom-to-image", to: "https://ga.jspm.io/npm:dom-to-image@2.6.0/src/dom-to-image.js"
