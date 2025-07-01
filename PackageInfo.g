#############################################################################
##
##  PackageInfo.g for the package `YAGS'
##  C. Cedillo, D. Lopez, R. MacKinney-Romero, M.A. Pizana, I.A. Robles
##  and R. Villarroel-Flores.

##

SetPackageInfo( rec(

PackageName := "YAGS",
Subtitle := "Yet Another Graph System",
Version := "0.0.6", 
Date := "06/09/2025", #dd/mm/yyyy format
##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "0.0.6">
##  <!ENTITY RELEASEDATE "9 Jun 2025">
##  <!ENTITY RELEASEYEAR "2025">
##  <#/GAPDoc>
License := "GPLV-3.0",
SourceRepository := rec(
    Type := "git",
    URL :=  "https://github.com/yags/yags/archive/v0.0.6",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://github.com/yags/yags",
README_URL      := Concatenation( ~.PackageWWWHome, "/README.md" ),
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/yags-", ~.Version ),

ArchiveFormats := ".tar.gz",

#TextFiles := ["init.g", ......],
BinaryFiles := ["doc/manual.dvi","doc/manual.pdf","draw",],

Persons := [
   rec(
    LastName := "Cedillo",
    FirstNames := "Carmen",
    IsAuthor := true,
    IsMaintainer := false,
    Email := "mc.cedilloc@gmail.com",
    Place := "México",
    Institution := "Universidad Autónoma Metropolitana"
       ),

    rec(
    LastName := "López",
    FirstNames := "Daniel",
    IsAuthor := true,
    IsMaintainer := true,
    Email := "cbi2203040422@titlani.uam.mx",
    Place := "México",
    Institution := "Universidad Autónoma Metropolitana"
      ),

  rec(
    LastName := "MacKinney-Romero",
    FirstNames := "Rene",
    IsAuthor := true,
    IsMaintainer := false,
    Email := "rene@xanum.uam.mx",
    WWWHome := "http://xamanek.izt.uam.mx/rene",
    Place := "México",
    Institution := "Universidad Autónoma Metropolitana"
    ),

  rec(
    LastName := "Pizaña",
    FirstNames := "Miguel Angel",
    IsAuthor := true,
    IsMaintainer := true,
    Email := "mpizana@gmail.com",
    WWWHome := "http://xamanek.izt.uam.mx/map",
    Place := "México",
    Institution := "Universidad Autónoma Metropolitana"
    ),

   rec(
    LastName := "Robles",
    FirstNames := "Ismael Ariel",
    IsAuthor := true,
    IsMaintainer := true,
    Email := "ismael@codeismo.com",
    WWWHome := "http://www.codeismo.com/",
    Place := "México",
    Institution := "Universidad Autónoma Metropolitana"
    ),

  rec(
    LastName := "Villarroel-Flores",
    FirstNames := "Rafael",
    IsAuthor := true,
    IsMaintainer := true,
    Email := "rafaelv@uaeh.edu.mx",
    WWWHome := "http://rvf0068.github.io",
    Place := "México",
    Institution := "Universidad Autónoma del Estado de Hidalgo"
      )

# provide such a record for each author and/or maintainer ...
],

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
# Status := "accepted",
Status := "other",

##  You must provide the next two entries if and only if the status is
##  "accepted":
# format: 'name (place)'
# CommunicatedBy := "Mike Atkinson (St. Andrews)",
# format: mm/yyyy
# AcceptDate := "08/1999",

##  For a central overview of all packages and a collection of all package
##  archives it is necessary to have two files accessible which should be
##  contained in each package:
##     - A README file, containing a short abstract about the package
##       content and installation instructions.
##     - The file you are currently reading or editing!
##  You must specify URLs for these two files, these allow to automate
##  the updating of package information on the GAP Website, and inclusion
##  and updating of the package in the GAP distribution.
##
#README_URL := "http://xamanek.izt.uam.mx/yags/README.md",
#PackageInfoURL := "http://xamanek.izt.uam.mx/yags/PackageInfo.g",

##  Here you  must provide a short abstract explaining the package content
##  in HTML format (used on the package overview Web page) and an URL
##  for a Webpage with more detailed information about the package
##  (not more than a few lines, less is ok):
##  Please, use '<span class="pkgname">GAP</span>' and
##  '<span class="pkgname">MyPKG</span>' for specifing package names.
##
AbstractHTML := "<span class=\"pkgname\">YAGS</span> is a package for \
computing with graphs (as in Graph Theory)",

#PackageWWWHome := "http://xamanek.izt.uam.mx/yags/",

##  On the GAP Website there is an online version of all manuals in the
##  GAP distribution. To handle the documentation of a package it is
##  necessary to have:
##     - an archive containing the package documentation (in at least one
##       of HTML or PDF-format, preferably both formats)
##     - the start file of the HTML documentation (if provided), *relative to
##       package root*
##     - the PDF-file (if provided) *relative to the package root*
##  For links to other package manuals or the GAP manuals one can assume
##  relative paths as in a standard GAP installation.
##  Also, provide the information which is currently given in your packages
##  init.g file in the command DeclarePackage(Auto)Documentation
##  (for future simplification of the package loading mechanism).
##
##  Please, don't include unnecessary files (.log, .aux, .dvi, .ps, ...) in
##  the provided documentation archive.
##
## in case of several help books give a list of such records here:
PackageDoc := rec(
  # use same as in GAP
  BookName := "YAGS",
  ArchiveURLSubset := ["doc","doc/mannual.pdf"],
  HTMLStart := "doc/chap0.html",
  PDFFile := "doc/manual.pdf",
  # the path to the .six file used by GAP's help system
  SixFile := "doc/manual.six",
  # a longer title of the book, this together with the book name should
  # fit on a single text line (appears with the '?books' command in GAP)
  LongTitle := "Yet Another Graph System",
  # Should this help book be autoloaded when GAP starts up? This should
  # usually be 'true', otherwise say 'false'.
  Autoload := true
),


##  Are there restrictions on the operating system for this package? Or does
##  the package need other packages to be available?
Dependencies := rec(
  # GAP version, use version strings for specifying exact versions,
  # prepend a '>=' for specifying a least version.
  GAP := ">=4.5",
  # list of pairs [package name, (least) version],  package name is case
  # insensitive, least version denoted with '>=' prepended to version string.
  # without these, the package will not load
  # NeededOtherPackages := [["GAPDoc", ">= 0.99"]],
  NeededOtherPackages := [],
  # without these the package will issue a warning while loading
  # SuggestedOtherPackages := [],
  SuggestedOtherPackages := [],
  # needed external conditions (programs, operating system, ...)  provide
  # just strings as text or
  # pairs [text, URL] where URL  provides further information
  # about that point.
  # (no automatic test will be done for this, do this in your
  # 'AvailabilityTest' function below)
  # ExternalConditions := []
  ExternalConditions := []
),

## Provide a test function for the availability of this package, see
## documentation of 'Declare(Auto)Package', this is the <tester> function.
## For packages which will not fully work, use 'Info(InfoWarning, 1,
## ".....")' statements. For packages containing nothing but GAP code,
## just say 'ReturnTrue' here.
## (When this is used for package loading in the future the availability
## tests of other packages, as given above, will be done automatically and
## need not be included here.)

AvailabilityTest := ReturnTrue,

##  Suggest here if the package should be *automatically loaded* when GAP is
##  started.  This should usually be 'false'. Say 'true' only if your package
##  provides some improvements of the GAP library which are likely to enhance
##  the overall system performance for many users.
Autoload := false,

##  If the default banner does not suffice then provide a string that is
##  printed when the package is loaded (not when it is autoloaded or if
##  command line options `-b' or `-q' are given).
BannerString := "Loading  YAGS - Yet Another Graph System; Version 0.0.6.\
\nCopyright (C) 2025 by the YAGS authors; for details type: ?yags:authors\
\nThis is free software under GPLv3; for details type: ?yags:copyright \n",

Subtitle := "Yet Another Graph System",

##  *Optional*, but recommended: path relative to package root to a file which
##  contains as many tests of the package functionality as sensible.
#TestFile := "tst/testall.g",

##  *Optional*: Here you can list some keyword related to the topic
##  of the package.
# Keywords := ["Smith normal form", "p-adic", "rational matrix inversion"]
Keywords := ["graph","graph theory","clique", "clique graph", "graph morphism", "backtracking"]

));


