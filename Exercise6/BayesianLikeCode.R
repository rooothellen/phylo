
library(dplyr)
library(ggplot2)
library(cowplot)

#' Generates a "Triangle" Prior Probability Distribution
#'
#' @param vals Sample space of all possible parameter values.
#' @return 2 column data.frame containing the parameter and its corresponding
#'   prior probability.
get_prior_distr <- function(vals) {
    vals.pmin <- pmin(vals, 1 - vals)
    
    # Normalize the prior so that they sum to 1.
    dplyr::data_frame(theta = vals,
    prior = vals.pmin / sum(vals.pmin))
}


#' Get the Likelihood Probability Distribution
#'
#' Generates a likelihood probability distribution data frame
#'
#' @param theta.vals Vector of theta values for the binomial distribution.
#' @param num.heads Number of heads.
#' @param num.tails Number of tails.
#' @return data_frame for the likelihood probability distribution.
get_likelihood_df <- function(theta.vals, num.heads, num.tails) {
    likelihood.vals <- c()
    for (cur.theta.val in theta.vals) {
        likelihood.vals <-
        c(likelihood.vals,
        (cur.theta.val^num.heads) * (1 - cur.theta.val)^(num.tails))
    }
    
    likelihood.df <- dplyr::data_frame(theta = theta.vals,
    likelihood = likelihood.vals)
    likelihood.df
}

#' Get Posterior Probability Distribution
#'
#" Generate a posterior probability distribution data.frame.
#'
#' @param likelihood.df Likelihood distribution data.frame from
#'   get_likelihood_df().
#' @param theta.prior.distr.df Prior distribution data.frame from
#'   get_prior_distr().
#' @return data_frame of the posterior probability distribution.
get_posterior_df <- function(likelihood.df, prior.distr.df) {
    
    marg.likelihood <- sum(likelihood.df[["likelihood"]])
    
    posterior.df <-
    likelihood.df %>%
    dplyr::left_join(prior.distr.df) %>%
    dplyr::mutate(marg_likelihood = marg.likelihood) %>%
    dplyr::mutate(post_prob = (likelihood * prior) / marg.likelihood)
    
    posterior.df
}


#' Plots the Prior Probability Distribution
plot_prior_distr <- function(prior.distr.df) {

    theta.prior.p <-
    prior.distr.df %>%
    ggplot(aes(x = theta, y = prior)) +
      geom_point(size=4) +
      geom_segment(aes(x = theta, xend = theta, y = prior, yend = 0), size=1) +
      xlab(expression(theta)) +
      ylab(expression(paste("P(", theta, ")"))) +
      ggtitle("Prior Distribution")
      
      theta.prior.p
}


#' Plots Likelihood Probability Distribution
plot_likelihood_prob_distr <- function(likelihood.df) {
    likelihood.df %>%
    ggplot(aes(x = theta, y = likelihood)) +
    geom_point(size=4) +
    geom_segment(aes(x = theta, xend = theta, y = likelihood, yend = 0), size=1) +
    xlab(expression(theta)) +
    ylab(expression(paste("P(D|", theta, ")"))) +
    ggtitle("Likelihood Distribution")
}


#' Plots Posterior Probability Distribution
plot_posterior_prob_distr <- function(posterior.df, theta.vals) {
    posterior.df %>%
    ggplot(aes(x = theta, y = post_prob)) +
    geom_point(size=4) +
    geom_segment(aes(x = theta, xend = theta, y = post_prob, yend = 0), size=1) +
    xlab(expression(theta)) +
    ylab(expression(paste("P(", theta, "|D)"))) +
    ggtitle("Posterior Distribution")
}



##### Remove the hashtags on the following lines of code #####





