# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-checkbox-select-all", to: "https://ga.jspm.io/npm:stimulus-checkbox-select-all@5.0.0/dist/stimulus-checkbox-select-all.es.js"
pin "canvas-confetti", to: "https://ga.jspm.io/npm:canvas-confetti@1.4.0/src/confetti.js"
