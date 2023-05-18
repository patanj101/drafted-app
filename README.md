# Drafted Advertising

This application helps automate the bid change process for Amazon Advertising. Until API access is granted, this project will rely on bulk files.

Please update this readme with all information needed to configure, run, and deploy the application.

## Coding best practices

- Please stick to mainstream technologies and dependencies. Let's discuss exceptions.

- Tests can wait until after MVP 

- Please use [trunk-based development and toggles](https://www.infobip.com/developers/blog/trunk-based-development-vs-feature-branching) 

- Don’t try to abstract code unless it repeats at least 3 times. [WET before DRY](https://twitter.com/ID_AA_Carmack/status/1646636487558017030)  

- No staging environment: [https://refactoring.fm/p/do-you-need-staging?s=w](https://refactoring.fm/p/do-you-need-staging?s=w)

- Readability is more important than clever code and minor performance gains:

  **Bad:** 

      @users = User.where('created_at >= ?', Time.zone.now.beginning_of_day)

  **Good:** 

      today = Time.zone.now.beginning_of_day
      @users = User.where('created_at >= ?', today)

  **Bad:**

      def calculate_total(order)
          order.items.inject(0) { |total, item| total + item.price * item.quantity }
      end

  **Good:**

      def calculate_total(order)
        total = 0
        order.items.each do |item|
          total += item.price * item.quantity
        end
        total
      end

