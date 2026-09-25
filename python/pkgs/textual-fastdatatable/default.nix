{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pandas,
  pyarrow,
  pytz,
  textual,
  tzdata,
  polars,
}:

buildPythonPackage rec {
  pname = "textual-fastdatatable";
  version = "0.19.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tconbeer";
    repo = "textual-fastdatatable";
    tag = "v${version}";
    hash = "sha256-buOgvDFzK6wRrzm7AvT7BFFzHbCNEqX3OVsFS1FyJio=";
  };

  build-system = [ hatchling ];

  dependencies = [
    pandas
    pyarrow
    pytz
    textual
    tzdata
  ];
  optional-dependencies = {
    polars = [ polars ];
  };

  pythonRelaxDeps = [
    "numpy"
  ];

  pythonImportsCheck = [ "textual_fastdatatable" ];

  meta = {
    description = "Performance-focused reimplementation of Textual's DataTable widget, with a pluggable data storage backend";
    homepage = "https://github.com/tconbeer/textual-fastdatatable";
    license = lib.licenses.mit;
  };
}
