{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools_80,
  six,
  appdirs,
  pytz,
}:

buildPythonPackage rec {
  pname = "fs";
  version = "2.4.16";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-rpfH1RIT9LcLapWCklMCiQkN46fhWEHhCPvhRPBp0xM=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    # Remove pkg_resources.declare_namespace calls (unnecessary with implicit namespaces)
    substituteInPlace fs/__init__.py fs/opener/__init__.py \
      --replace-fail '__import__("pkg_resources").declare_namespace(__name__)  # type: ignore' ""
  '';

  dependencies = [
    setuptools_80 # provides pkg_resources, used by fs.opener.registry
    six
    appdirs
    pytz
  ];

  pythonImportsCheck = [ "fs" ];

  meta = {
    description = "Filesystem abstraction";
    homepage = "https://github.com/PyFilesystem/pyfilesystem2";
    license = lib.licenses.bsd3;
  };
}
