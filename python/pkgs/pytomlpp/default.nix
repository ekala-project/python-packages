{ lib
, buildPythonPackage
, fetchFromGitHub
, pybind11
,
}:

buildPythonPackage rec {
  pname = "pytomlpp";
  version = "1.1.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "bobfang1992";
    repo = "pytomlpp";
    rev = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-RRsjnZK0FJiSkpWxurs9vJFyo2SUAKyFKXoJ8bcsHKI=";
  };

  # The latest setuptools has deprecated `setup_requires` and will attempt to automatically invoke `pip` to install dependencies during the build.
  patches = [ ./0001-remove-setup_requires.patch ];

  buildInputs = [ pybind11 ];

  meta = {
    description = "Python wrapper for tomlplusplus";
    homepage = "https://github.com/bobfang1992/pytomlpp";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
