% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/distlist.R
\name{distlist}
\alias{distlist}
\title{Compute distance lists on the CShapes dataset}
\usage{
distlist(
  date,
  type = "mindist",
  keep = 0.1,
  useGW = TRUE,
  dependencies = FALSE
)
}
\arguments{
\item{date}{The date for which the distance list should be computed. This argument must be of type Date and must be in the range 1/1/1886 - end of the dataset.}

\item{type}{Specifies the type of distance list: "capdist" for capital distances, "centdist" for centroid distances, and "mindist" for minimum distances.}

\item{keep}{Proportion of points to retain following polygon simplification using Douglas-Peucker algorithm. Default: 0.1. See package \code{rmapshaper}.}

\item{useGW}{Boolean argument specifying the system membership coding. TRUE: Gleditsch and Ward (GW, default). FALSE: Correlates of War (COW).}

\item{dependencies}{Boolean argument specifying whether dependent territories must be included. TRUE: Returns polygons for both independent states and dependent units. FALSE: Returns polygons for indepdendent states only (default).}
}
\value{
A datafarame with the columns ccode1 and ccode2 containing the country identifiers in the specified coding system (COW or GW).
}
\description{
This function returns between-country distances in km for the given date. Output format is a dataframe that lists distances between each pair of countries.
The function can compute different types of distance lists, specified by the \code{type} parameter:
\enumerate{
  \item Capital distances
  \item Centroid distances
  \item Minimum distances between polygons
}
The latter computation is very expensive if polygons consist of many points.
For that reason, the function simplifies the country polygons according to the Douglas-Peucker algorithm
(http://en.wikipedia.org/wiki/Ramer-Douglas-Peucker_algorithm), which eliminates points from the polygons and speeds up computation.
The \code{keep} parameter specifies the proportion of points to retain in the simplified country polygons.
Note that the function returns directed dyads. For example, if there is a country with code 1 and a country with code 2, the resulting data frame contains the dyads (1,2), (2,1), (1,1) and (2,2).
}
