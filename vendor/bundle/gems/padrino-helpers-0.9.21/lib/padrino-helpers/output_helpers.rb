module Padrino
  module Helpers
    module OutputHelpers
      ##
      # Captures the html from a block of template code for any available handler
      #
      # ==== Examples
      #
      #   capture_html(&block) => "...html..."
      #
      def capture_html(*args, &block)
        handler = self.find_proper_handler
        if handler && handler.is_type? && handler.block_is_type?(block)
          captured_html = handler.capture_from_template(*args, &block)
        end
        # invoking the block directly if there was no template
        captured_html = block_given? && block.call(*args) if captured_html.blank?
        captured_html
      end

      ##
      # Outputs the given text to the templates buffer directly
      #
      # ==== Examples
      #
      #   concat_content("This will be output to the template buffer")
      #
      def concat_content(text="")
        handler = self.find_proper_handler
        if handler && handler.is_type?
          handler.concat_to_template(text)
        else # theres no template to concat, return the text directly
          text
        end
      end

      ##
      # Returns true if the block is from a supported template type; false otherwise.
      # Used to determine if html should be returned or concatenated to the view
      #
      # ==== Examples
      #
      #   block_is_template?(block)
      #
      def block_is_template?(block)
        handler = self.find_proper_handler
        block && handler && handler.block_is_type?(block)
      end

      ##
      # Capture a block or text of content to be rendered at a later time.
      # Your blocks can also receive values, which are passed to them by <tt>yield_content</tt>
      #
      # ==== Examples
      #
      #   content_for(:name) { ...content... }
      #   content_for(:name) { |name| ...content... }
      #   content_for(:name, "I'm Jeff")
      #
      def content_for(key, content = nil, &block)
        content_blocks[key.to_sym] << (block_given? ? block : Proc.new { content })
      end

      ##
      # Render the captured content blocks for a given key.
      # You can also pass values to the content blocks by passing them
      # as arguments after the key.
      #
      # ==== Examples
      #
      #   yield_content :include
      #   yield_content :head, "param1", "param2"
      #   yield_content(:title) || "My page title"
      #
      def yield_content(key, *args)
        blocks = content_blocks[key.to_sym]
        return nil if blocks.empty?
        blocks.map { |content|
          capture_html(*args, &content)
        }.join
      end

      protected
        ##
        # Retrieves content_blocks stored by content_for or within yield_content
        #
        # ==== Examples
        #
        #   content_blocks[:name] => ['...', '...']
        #
        def content_blocks
          @content_blocks ||= Hash.new {|h,k| h[k] = [] }
        end

        ##
        # Retrieves the template handler for the given output context.
        # Can handle any output related to capturing or concating in a given template.
        #
        # ==== Examples
        #
        #   find_proper_handler => <OutputHelpers::HamlHandler>
        #
        def find_proper_handler
          OutputHelpers.handlers.map { |h| h.new(self) }.find { |h| h.is_type? }
        end
    end # OutputHelpers
  end # Helpers
end # Padrino