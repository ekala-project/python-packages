{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "spdx";
  version = "2.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bbqsrc";
    repo = "spdx-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-lfTgAX4Wl01xrvLA12ZUqjah7ZiLafMAU+yNNdVkRk0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "spdx" ];

  # upstream has no tests
  meta = {
    description = "SPDX license list database";
    homepage = "https://github.com/bbqsrc/spdx-python";
    license = lib.licenses.cc0;
  };
})
