{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "interface-meta";
  version = "2.0.1";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "matthewwardrop";
    repo = "interface_meta";
    rev = "v${version}";
    sha256 = "sha256-1of84/Y/efGlz33FD06M2A7b4cJCKJTKYm+tWHPJzak=";
  };

  env.SETUPTOOLS_SCM_PRETEND_VERSION = version;

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "interface_meta" ];
  meta = {
    homepage = "https://github.com/matthewwardrop/interface_meta";
    description = "Convenient way to expose an extensible API with enforced method signatures and consistent documentation";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
