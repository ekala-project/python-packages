{
  lib,
  buildPythonPackage,
  dataproperty,
  dominate,
  elasticsearch,
  fetchFromGitHub,
  loguru,
  mbstrdecoder,
  pandas,
  pathvalidate,
  pyyaml,
  setuptools-scm,
  simplejson,
  tabledata,
  tcolorpy,
  toml,
  typepy,
  xlsxwriter,
  xlwt,
}:

buildPythonPackage rec {
  pname = "pytablewriter";
  version = "1.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "thombashi";
    repo = "pytablewriter";
    tag = "v${version}";
    hash = "sha256-YuuSMKTSG3oybvA6TDWNnGg4EiDAw2tRlM0S9mBQlkc=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    dataproperty
    mbstrdecoder
    pathvalidate
    tabledata
    tcolorpy
    typepy
  ];

  optional-dependencies = {
    all = [
      dominate
      elasticsearch
      loguru
      pandas
      # pytablereader
      pyyaml
      simplejson
      toml
      xlsxwriter
      xlwt
    ];
    es = [ elasticsearch ];
    es8 = [ elasticsearch ];
    excel = [
      xlwt
      xlsxwriter
    ];
    html = [ dominate ];
    logging = [ loguru ];
    # from = [
    #   pytablereader
    # ];
    pandas = [ pandas ];
    # sqlite = [
    #   simplesqlite
    # ];
    # theme = [
    #   pytablewriter-altrow-theme
    # ];
    toml = [ toml ];
    yaml = [ pyyaml ];
  };
  meta = {
    description = "Library to write a table in various formats";
    homepage = "https://github.com/thombashi/pytablewriter";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
