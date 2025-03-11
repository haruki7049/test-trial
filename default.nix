{
  pkgs ? import (builtins.fetchTarball "https://github.com/haruki7049/nixpkgs/archive/c49d203b4edc3fd47cf0c49a38a2e66c6b8ddabd.tar.gz") { },
}:

pkgs.sbcl.buildASDFSystem {
  pname = "test-trial";
  version = "dev";
  src = pkgs.lib.cleanSource ./.;

  lispLibs = [
    pkgs.sbclPackages.trial
  ];

  # XDG_CACHE_HOME is needed to success the build.
  # The following is the error:
  #
  #; compilation unit aborted
  #;   caught 1 fatal ERROR condition
  #BUILD FAILED: Error opening #P"/nix/store/0kxw6b8nnz2vkdvm8h5glnadl523gyxk-sbcl-machine-state-20241012-git/opengl-tmpGHU3ALSV.fasl":
  #
  #                Permission denied

  XDG_CACHE_HOME = "$TMPDIR/.cache";
}
