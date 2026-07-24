{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  click,
}:

buildPythonPackage rec {
  pname = "click-help-colors";
  version = "0.9.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-9Mq+Us9VApm4iI9PLuTF81msJ+M7z+TWHbR3haXMk2w=";
  };

  build-system = [ setuptools ];

  dependencies = [ click ];

  pythonImportsCheck = [ "click_help_colors" ];

  meta = {
    description = "Colorization of help messages in Click";
    homepage = "https://github.com/click-contrib/click-help-colors";
    license = lib.licenses.mit;
  };
}
