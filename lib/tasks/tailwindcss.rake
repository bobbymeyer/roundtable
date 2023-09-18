# frozen_string_literal: true
# TAILWIND_COMPILE_COMMAND = "#{RbConfig.ruby} #{Pathname.new(__dir__).to_s}/../../exe/tailwindcss -i '#{Rails.root.join("app/assets/stylesheets/application.tailwind.css")}' -o '#{Rails.root.join("app/assets/builds/tailwind.css")}' -c '#{Rails.root.join("config/tailwind.config.js")}' --minify"
# SIMPLE_FORM_TAILWIND_GEMDIR = `bundle show simple_form_tailwind_css`
#
# Rake::Task["tailwindcss:build"].clear
# Rake::Task["tailwindcss:watch"].clear
# namespace :tailwindcss do
#   desc "Build your Tailwind CSS"
#   task :build do
#     system({"SIMPLE_FORM_TAILWIND_GEMDIR" => SIMPLE_FORM_TAILWIND_GEMDIR}, TAILWIND_COMPILE_COMMAND, exception: true)
#   end
#
#   desc "Watch and build your Tailwind CSS on file changes"
#   task :watch do
#     system({"SIMPLE_FORM_TAILWIND_GEMDIR" => SIMPLE_FORM_TAILWIND_GEMDIR}, "#{TAILWIND_COMPILE_COMMAND} -w")
#   end
# end
#
