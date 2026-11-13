{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  packaging,
  vcs-versioning,

  # optional-dependencies
  rich,
}:

let
  # setuptools-scm 10.x requires vcs-versioning >=2.5,<3 (it imports private
  # modules such as vcs_versioning._environment), while the default
  # vcs-versioning is still 1.x.
  vcs-versioning2 = vcs-versioning.overridePythonAttrs (old: rec {
    version = "2.6.0";
    src = fetchPypi {
      pname = "vcs_versioning";
      inherit version;
      hash = "sha256-IukVkoji2Lyi+m9sMcNMnGauwVf2Dp5Sb10WDSUW1g8=";
    };
    postPatch = "";
    env = { };
    passthru = { };
  });
in
buildPythonPackage (finalAttrs: {
  pname = "setuptools-scm";
  version = "10.3.4";
  pyproject = true;

  src = fetchPypi {
    pname = "setuptools_scm";
    inherit (finalAttrs) version;
    hash = "sha256-pp8ov8JFYIeBIF6RL6rkN8KyFldzr6TnuXnXdEemndI=";
  };

  postPatch = null;

  build-system = [
    setuptools
    vcs-versioning2
  ];

  dependencies = [
    packaging
    setuptools
    vcs-versioning2
  ];

  optional-dependencies = {
    rich = [ rich ];
  };

  pythonImportsCheck = [ "setuptools_scm" ];

  setupHook = ./setup-hook.sh;

  passthru.vcs-versioning = vcs-versioning2;

  meta = {
    homepage = "https://github.com/pypa/setuptools_scm/";
    description = "Handles managing your python package versions in scm metadata";
    license = lib.licenses.mit;
  };
})
