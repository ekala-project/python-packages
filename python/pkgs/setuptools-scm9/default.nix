{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  packaging,
  vcs-versioning,
}:

let
  # setuptools-scm 10.x requires vcs-versioning >=2.5,<3, while the default
  # vcs-versioning (1.x) is still paired with setuptools-scm 9.x.
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

  build-system = [
    setuptools
    vcs-versioning2
  ];

  dependencies = [
    packaging
    setuptools
    vcs-versioning2
  ];

  pythonImportsCheck = [ "setuptools_scm" ];

  passthru.vcs-versioning = vcs-versioning2;

  meta = {
    description = "Handles managing your python package versions in scm metadata";
    homepage = "https://github.com/pypa/setuptools_scm";
    license = lib.licenses.mit;
  };
})
