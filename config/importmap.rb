# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/helpers", under: "helpers"

pin "@rails/activestorage", to: "https://ga.jspm.io/npm:@rails/activestorage@7.0.5/app/assets/javascripts/activestorage.esm.js"
pin "alpine-turbo-drive-adapter", to: "https://ga.jspm.io/npm:alpine-turbo-drive-adapter@2.0.0/dist/alpine-turbo-drive-adapter.esm.js"
pin "alpinejs", to: "https://ga.jspm.io/npm:alpinejs@3.12.1/dist/module.esm.js"
pin "@vue/reactivity", to: "https://ga.jspm.io/npm:@vue/reactivity@3.1.4/dist/reactivity.esm-browser.js"
pin "@alpinejs/persist", to: "https://ga.jspm.io/npm:@alpinejs/persist@3.12.1/dist/module.esm.js"
pin "gridjs", to: "https://ga.jspm.io/npm:gridjs@6.0.6/dist/gridjs.module.js"
pin "dropzone", to: "https://ga.jspm.io/npm:dropzone@6.0.0-beta.2/dist/dropzone.mjs"
pin "just-extend", to: "https://ga.jspm.io/npm:just-extend@5.1.1/index.esm.js"
