{
  lib,
  buildPythonPackage,
  emoji,
  fetchFromGitHub,
  freezegun,
  tzdata,
  pydantic,
  pytest-benchmark,
  pytestCheckHook,
  python-dateutil,
  setuptools,
  syrupy,
}:

buildPythonPackage (finalAttrs: {
  pname = "ical";
  version = "14.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "allenporter";
    repo = "ical";
    tag = finalAttrs.version;
    hash = "sha256-Rl/tEOG+n7MCd/kHmoluBS4YI8+Jd4pxgvmUyp9eOag=";
  };

  build-system = [ setuptools ];

  dependencies = [
    python-dateutil
    tzdata
    pydantic
  ];

  nativeCheckInputs = [
    emoji
    freezegun
    pytest-benchmark
    pytestCheckHook
    syrupy
  ];

  pytestFlags = [ "--benchmark-disable" ];

  pythonImportsCheck = [ "ical" ];

  meta = {
    description = "Library for handling iCalendar";
    homepage = "https://github.com/allenporter/ical";
    license = lib.licenses.asl20;
  };
})
