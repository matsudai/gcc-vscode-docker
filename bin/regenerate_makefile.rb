#!/usr/bin/env ruby

require 'pathname'
require 'shellwords'

build_targets = Pathname.glob("src/**/*.{c,cc,cpp,cxx}")
test_targets = Pathname.glob("test/**/*_test.{c,cc,cpp,cxx}")

commands = [
  <<~EOS
    build/out: #{build_targets.map { |t| Shellwords.escape(Pathname('.cache').join(t.sub_ext('.o'))) }.join(' ')}
    \t@mkdir -p $(@D)
    \tg++ $^ -o $@

    build/test: #{(build_targets + test_targets - [Pathname('src/main.cpp')]).map { |t| Shellwords.escape(Pathname('.cache').join(t.sub_ext('.o'))) }.join(' ')}
    \t@mkdir -p $(@D)
    \tg++ $^ -o $@ -lgtest -lgtest_main -pthread
  EOS
]

commands += (build_targets + test_targets).map do |build_target|
  outdir = Pathname('.cache').join(build_target.dirname)
  command = "#{`g++ -MM #{Shellwords.escape(build_target)}`}".chomp

  <<~EOS
    #{outdir}/#{command}
    \t@mkdir -p $(@D)
    \tg++ -c $< -o $@
  EOS
end

makefile = File.read('Makefile').match(/(?<head>\A(.|\R)*^# ==== Begin Generated Config ==== #\R\R)(?<overwritten>(.|\R)*)(?<tail>\R^# ==== End Generated Config ==== #\R(.|\R)*\z)/)
File.write('Makefile', makefile['head'] + commands.join("\n") + makefile['tail'])
