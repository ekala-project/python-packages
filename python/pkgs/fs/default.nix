{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
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
    # Remove pkg_resources.declare_namespace call that fails on Python 3.13
    substituteInPlace fs/__init__.py \
      --replace-fail '__import__("pkg_resources").declare_namespace(__name__)  # type: ignore' ""
  '';

  dependencies = [
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
