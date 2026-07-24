{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "xdg-base-dirs";
  version = "6.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "srstevenson";
    repo = "xdg-base-dirs";
    tag = version;
    hash = "sha256-iXK9WURTfmpl5vd7RsT0ptwfrb5UQQFqMMCu3+vL+EY=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "xdg_base_dirs" ];

  meta = {
    description = "Implementation of the XDG Base Directory Specification in Python";
    homepage = "https://github.com/srstevenson/xdg-base-dirs";
    license = lib.licenses.isc;
  };
}
