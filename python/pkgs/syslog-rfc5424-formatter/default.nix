{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
,
}:

buildPythonPackage (finalAttrs: {
  pname = "syslog-rfc5424-formatter";
  version = "1.2.3";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "easypost";
    repo = "syslog-rfc5424-formatter";
    tag = "v${finalAttrs.version}";
    hash = "sha256-dvRSOMXRmZf0vEEyX6H7OBSfo/PgyOLKuDS8X6g4qe0=";
  };

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [ "syslog_rfc5424_formatter" ];

  meta = {
    description = "Python logging formatter for emitting RFC5424 Syslog messages";
    homepage = "https://github.com/easypost/syslog-rfc5424-formatter";
    license = lib.licenses.isc;
    maintainers = [ ];
  };
})
