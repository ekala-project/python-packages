{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "xlsxwriter";
  version = "3.2.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jmcnamara";
    repo = "XlsxWriter";
    tag = "RELEASE_${version}";
    hash = "sha256-nr7Qw24BzQo/qEpyM9687mUaebzzHv1FAPmsBVdMekg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "xlsxwriter" ];

  meta = {
    description = "Module for creating Excel XLSX files";
    homepage = "https://xlsxwriter.readthedocs.io/";
    license = lib.licenses.bsd2;
    mainProgram = "vba_extract.py";
  };
}
