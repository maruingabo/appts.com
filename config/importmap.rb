# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "@stimulus-components/popover", to: "@stimulus-components--popover.js" # @7.0.0
pin "@stimulus-components/notification", to: "@stimulus-components--notification.js" # @3.0.0
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-use" # @0.52.2
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
