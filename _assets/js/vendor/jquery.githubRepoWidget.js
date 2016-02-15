;jQuery(document).ready(function($){
    var i = 0;

    $('.github-widget').each(function(){
        i++;

        var $container = $(this), $widget,
            repo = $container.data('repo'),
            vendorName = repo.split('/')[0],
            repoName = repo.split('/')[1],
            vendorUrl = "http://github.com/" + vendorName,
            repoUrl = "http://github.com/" + vendorName + '/' + repoName;

        $widget = $(
                '<div class="github-box repo card">'
                +'<div class="github-box-title card-header">'
                +'<a class="owner" href="' + vendorUrl + '" title="' + vendorUrl + '">' + vendorName + '</a>'
                +'/'
                +'<a class="repo" href="' + repoUrl + '" title="' + repoUrl + '">' + repoName + '</a>'
                +'<span class="pull-right hidden-xs-down">'
                +'<a class="stargazers" href="' + repoUrl + '/stargazers" title="See stargazers"><i class="fa fa-fw fa-star"></i><span class="text">?</span></a>'
                +'<a class="watchers" href="' + repoUrl + '/watchers" title="See watchers"><i class="fa fa-fw fa-eye"></i><span class="text">?</span></a>'
                +'<a class="forks" href="' + repoUrl + '/network/members" title="See forkers"><i class="fa fa-fw fa-code-fork"></i><span class="text">?</span></a>'
                +'</span>'
                +'</div>'
                +'<div class="github-box-content card-block">'
                +'<p class="description card-text"><span></span> &mdash; <a href="' + repoUrl + '#readme">Read More</a></p>'
                +'<p class="link card-text"></p>'
                +'</div>'
                +'<div class="github-box-download card-footer small">'
                +'<div class="updated"><span class="text"></span>'
                +'<a class="pull-right hidden-xs hidden-sm" href="' + repoUrl + '/zipball/master" title="Get a zip archive of this repository"><i class="fa fa-download fa-fw"></i></a>'
                +'</div></div>'
                +'</div>'
        );

        $widget.appendTo($container);

        $.ajax({
            url: 'https://api.github.com/repos/' + repo,
            dataType: 'jsonp',
            success: function(results) {
                var repo = results.data, date, pushed_at = 'unknown';

                if (repo.pushed_at) {
                    date = new Date(repo.pushed_at);
                    pushed_at = (date.getMonth() + 1) + '-' + date.getDate() + '-' + date.getFullYear();
                }

                $widget.find('.stargazers .text').text(repo.stargazers_count);
                $widget.find('.watchers .text').text(repo.subscribers_count);
                $widget.find('.forks .text').text(repo.forks_count);
                $widget.find('.description span').text(repo.description);
                $widget.find('.updated .text').html('Latest commit to the <strong>' + repo.default_branch + '</strong> branch on ' + pushed_at);

                // Don't show "null" if the repo has no homepage URL.
                if(repo.homepage != null) $widget.find('.link').append($('<a />').attr('href', repo.homepage).text(repo.homepage));
            }
        });
    });
});
