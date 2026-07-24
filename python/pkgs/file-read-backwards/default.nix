{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "file-read-backwards";
  version = "3.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "file_read_backwards";
    inherit version;
    hash = "sha256-VHjTBeuuquj+PGWFok38MmIXAiRFCsyTITmPDSbN0Qk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "file_read_backwards" ];

  meta = {
    description = "Memory efficient way of reading files line-by-line from the end of file";
    homepage = "https://github.com/RobinNil/file_read_backwards";
    license = lib.licenses.mit;
  };
}
