{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  flask,
}:

buildPythonPackage rec {
  pname = "flask-script";
  version = "2.0.6";
  pyproject = true;

  src = fetchPypi {
    pname = "Flask-Script";
    inherit version;
    hash = "sha256-ZCWWPZEFTPzBhYBxQccxSpxa1GMlkRvSTctIm9AWHGU=";
  };

  build-system = [ setuptools ];

  dependencies = [ flask ];

  postPatch = ''
    substituteInPlace flask_script/__init__.py \
      --replace-fail "from flask._compat import text_type" "from ._compat import text_type"
    substituteInPlace flask_script/commands.py \
      --replace-fail "from flask import _request_ctx_stack" "from flask import current_app" \
      --replace-fail "_request_ctx_stack.top.app" "current_app._get_current_object()"
  '';

  pythonImportsCheck = [ "flask_script" ];

  meta = {
    homepage = "https://github.com/smurfix/flask-script";
    description = "Scripting support for Flask";
    license = lib.licenses.bsd3;
  };
}
