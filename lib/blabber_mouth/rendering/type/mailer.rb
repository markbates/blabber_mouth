# module Rendering # :nodoc:
#   module Type # :nodoc:
#     class Notifier < BlabberMouth::Rendering::Type::FileBase # :nodoc:
#       
#       def render
#         x_file = BlabberMouth::Paths.notifier_templates(self._render_value, self._options[:format])
#         render_file(x_file)
#       end
#       
#     end # BlabberMouth
#   end # Type
# end # Rendering
# 
# BlabberMouth::Rendering::Engine::Registry.instance.register(:notifier, :erb)