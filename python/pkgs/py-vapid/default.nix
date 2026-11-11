{
  lib,
  buildPythonPackage,
  fetchPypi,

  # dependencies
  cryptography,
}:

buildPythonPackage (finalAttrs: {
  pname = "py-vapid";
  version = "1.9.6";
  format = "wheel";

  # 1.9.6 is only published as a wheel on PyPI, and upstream has no matching git tag
  src = fetchPypi {
    pname = "py_vapid";
    inherit (finalAttrs) version;
    format = "wheel";
    python = "py2.py3";
    dist = "py2.py3";
    hash = "sha256-Btd1lRAW9j8NDW3Yur0zP8L4MfB2n9XbLh7Iz7vMxw8=";
  };

  dependencies = [ cryptography ];

  pythonImportsCheck = [ "py_vapid" ];

  meta = {
    description = "Library for VAPID header generation";
    homepage = "https://github.com/mozilla-services/vapid";
    license = lib.licenses.mpl20;
  };
})
