{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pybind11,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytomlpp";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bobfang1992";
    repo = "pytomlpp";
    tag = "v${finalAttrs.version}";
    fetchSubmodules = true;
    hash = "sha256-RRsjnZK0FJiSkpWxurs9vJFyo2SUAKyFKXoJ8bcsHKI=";
  };

  build-system = [ setuptools ];

  # The latest setuptools has deprecated `setup_requires` and will attempt to automatically invoke `pip` to install dependencies during the build.
  patches = [ ./0001-remove-setup_requires.patch ];

  buildInputs = [ pybind11 ];

  meta = {
    description = "Python wrapper for tomlplusplus";
    homepage = "https://github.com/bobfang1992/pytomlpp";
    license = lib.licenses.mit;
  };
})
