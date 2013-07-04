
class defaultconf {

  file { "/etc/modprobe.d/pcspkr.conf":
    ensure     => present,
    owner      => 'root',
    group      => 'root',
    mode       => '0544',
    source     => 'puppet:///modules/defaultconf/pcspkr.conf'
  }

  file { "/etc/modprobe.d/piix4.conf":
    ensure     => present,
    owner      => 'root',
    group      => 'root',
    mode       => '0544',
    source     => 'puppet:///modules/defaultconf/piix4.conf'
  }

}
