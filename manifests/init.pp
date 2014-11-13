# == Class: common_eis
#
class common_eis (
  $enable_afs            = false,
  $enable_autofs         = false,
  $enable_beuser         = false,
  $enable_customrepo     = false,
  $enable_logaggregation = false,
  $enable_nrpe           = false,
  $enable_nscd           = false,
  $enable_sudo           = false,
  $enable_vas            = false,
) {

  # validate type and convert string to boolean if necessary
  $enable_afs_type = type($enable_afs)
  if $enable_afs_type == 'string' {
    $afs_enabled = str2bool($enable_afs)
  } else {
    $afs_enabled = $enable_afs
  }
  if $afs_enabled == true {
    include afs
  }

  # validate type and convert string to boolean if necessary
  $enable_autofs_type = type($enable_autofs)
  if $enable_autofs_type == 'string' {
    $autofs_enabled = str2bool($enable_autofs)
  } else {
    $autofs_enabled = $enable_autofs
  }
  if $autofs_enabled == true {
    include eis_autofs
  }

  # validate type and convert string to boolean if necessary
  $enable_beuser_type = type($enable_beuser)
  if $enable_beuser_type == 'string' {
    $beuser_enabled = str2bool($enable_beuser)
  } else {
    $beuser_enabled = $enable_beuser
  }
  if $beuser_enabled == true {
    include beuser
  }

  # validate type and convert string to boolean if necessary
  $enable_customrepo_type = type($enable_customrepo)
  if $enable_customrepo_type == 'string' {
    $customrepo_enabled = str2bool($enable_customrepo)
  } else {
    $customrepo_enabled = $enable_customrepo
  }
  if $customrepo_enabled == true {
    include eis_customrepo
  }

  # validate type and convert string to boolean if necessary
  $enable_logaggregation_type = type($enable_logaggregation)
  if $enable_logaggregation_type == 'string' {
    $logaggregation_enabled = str2bool($enable_logaggregation)
  } else {
    $logaggregation_enabled = $enable_logaggregation
  }
  if $logaggregation_enabled == true {
    include logaggregation
  }

  # validate type and convert string to boolean if necessary
  $enable_nrpe_type = type($enable_nrpe)
  if $enable_nrpe_type == 'string' {
    $nrpe_enabled = str2bool($enable_nrpe)
  } else {
    $nrpe_enabled = $enable_nrpe
  }
  if $nrpe_enabled == true {
    include eis_nrpe
  }

  # validate type and convert string to boolean if necessary
  $enable_nscd_type = type($enable_nscd)
  if $enable_nscd_type == 'string' {
    $nscd_enabled = str2bool($enable_nscd)
  } else {
    $nscd_enabled = $enable_nscd
  }
  if $nscd_enabled == true {
    include nscd
  }

  # validate type and convert string to boolean if necessary
  $enable_sudo_type = type($enable_sudo)
  if $enable_sudo_type == 'string' {
    $sudo_enabled = str2bool($enable_sudo)
  } else {
    $sudo_enabled = $enable_sudo
  }
  if $sudo_enabled == true {
    include eis_sudo
  }

  # validate type and convert string to boolean if necessary
  $enable_vas_type = type($enable_vas)
  if $enable_vas_type == 'string' {
    $vas_enabled = str2bool($enable_vas)
  } else {
    $vas_enabled = $enable_vas
  }
  if $vas_enabled == true {
    include vas
  }
}
