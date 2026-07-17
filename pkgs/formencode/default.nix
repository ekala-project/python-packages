{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools-scm,
  six,
  legacy-cgi,
}:

buildPythonPackage rec {
  pname = "formencode";
  version = "2.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4X8WGZ0jLlT2eRIATzrTM827uBoaGhAjis8JurmfkZk=";
  };

  postPatch = ''
    sed -i '/setuptools_scm_git_archive/d' setup.py
  '';

  build-system = [ setuptools-scm ];

  dependencies = [
    six
    legacy-cgi
  ];

  doCheck = false;

  pythonImportsCheck = [ "formencode" ];

  meta = {
    description = "FormEncode validates and converts nested structures";
    homepage = "http://formencode.org";
    license = lib.licenses.mit;
  };
}
