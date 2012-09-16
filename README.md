## Command line tools for Parallels command line tools

For use with Parallels on the Mac. Use just like `prlctl` but instead of using `<vm_id|vm_name>`, do a partial search for the vm name or status. Don’t forget to set the executable bit: `chmod u+x prlvm`

    Usage:
      prlvm <command> [-a,--all][-t,--template] <search vm_[name|status]> [OPTIONS]
    List commands:
      prlvm [-c,--commands]
    List virtual machines or templates:
      prlvm [-l,--list][-t,--template]

By default, this tool focuses on one VM at a time. When a search results in multiple VM's, you will be prompted to choose one. Use the `-a` flag to override this behavior.

This also has an extra feature where bash aliases and function can be used to extend the behavior. See the `prl-tools.sh` file for some useful shortcuts and examples. There is a place for including extra files at the top `prlvm` script. Make sure that any files defined there are present.

## Useful commands:

suspend all running virtual machines.

    prlvm suspend -a running

List commands:
*external commands will be marked with an asterisk.*

    prlvm -c

List virtual machines:

    prlvm -l

List templates:

    prlvm -t

Get the ip, ip6 or mac address:
*tested only on ubuntu.*

    prlvm ip <search vm_[name|status]>
    prlvm ip6 <search vm_[name|status]>
    prlvm mac <search vm_[name|status]>

ssh:

    prlvm ssh <search vm_[name|status]>

If you want a list of all VM's to choose from, use `.`. Search accepts POSIX basic regular expressions.

    prlvm foo .

See the `foo` example command within `prl-tools.sh` > `prlvm.foo` for all the available variables.

