# This file contains the 'base' class used to configure a basic environment to be executed in grid'5000.

class env::base ( $parent_parameters = {} ){

  $base_parameters = {
    misc_keep_tmp => true,
    ganglia_enable => false
  }

  $parameters = merge ( $base_parameters, $parent_parameters )
  # Include min class
  class {
    'env::min':
      parent_parameters => $parameters;
  }

  class { 'env::base::do_not_clean_tmp':
     keep_tmp => $parameters['misc_keep_tmp'];
  }

  # Include kexec-tools
  class { 'env::base::configure_kexec': }
  # SSH modification
  class { 'env::base::increase_ssh_maxstartups': }
  # Specific tuning
  class { 'env::base::tcp_tuning_for_10gbe': }
  # Cpufreq
  class { 'env::base::enable_cpufreq_with_performance_governor': }
  # Ganglia
  class {
    'env::base::install_and_disable_ganglia':
      enable => $parameters['ganglia_enable']
  }
  # disable cstates
  class { 'env::base::disable_cstate': }
  # User packages
  class { 'env::base::packages': }

  # TODO those packages shouldn't be installed anymore in base (move to big)
  class { 'env::base::additional_packages': }
  # TODO drop from base (move to big or drop completely)
  class { 'env::base::sshfs': }
  # TODO the goal is to get IPoIB to work, nothing more. Strip down the rest.
  class { 'env::base::infiniband': }
  # TODO remove completely
  class { 'env::base::mx': }
  # TODO drop from base (move to big)
  class { 'env::base::openmpi': }
}
