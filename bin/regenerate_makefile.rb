#!/usr/bin/env ruby

require 'pathname'
require 'shellwords'

build_targets = Pathname.glob("src/**/*{c,cc,cpp,cxx}")

commands = [
  <<~EOS
    build/a.out: #{build_targets.map { |t| Shellwords.escape(t.sub(/^src/, 'build').sub_ext('.o')) }.join(' ')}
    \t@mkdir -p $(@D)
    \t$(CC) $^ -o $@
  EOS
]

commands += build_targets.map do |build_target|
  outdir = build_target.sub(/^src/, 'build').dirname
  command = "#{`g++ -MM #{Shellwords.escape(build_target)}`}".chomp

  <<~EOS
    #{outdir}/#{command}
    \t@mkdir -p $(@D)
    \t$(CC) -c $< -o $@
  EOS
end

makefile = File.read('Makefile').match(/(?<head>\A(.|\R)*^# ==== Begin Generated Config ==== #\R\R)(?<overwritten>(.|\R)*)(?<tail>\R^# ==== End Generated Config ==== #\R(.|\R)*\z)/)
File.write('Makefile', makefile['head'] + commands.join("\n") + makefile['tail'])
