module VideoHelper
  def show_video(video)
    vids =  ActiveSupport::JSON.decode video.url
    case video.player

    when 'flowplayer'
     flowplay =<<FLOW
     <a  id="player"
        href="#{video.url}"  
        style="width:640px;height:480px;"  
     > 
       <img style="width:640px;height:480px;"  src="/images/TheSecret.jpg"/>
     </a>
FLOW
     raw flowplay
    when 'html5'
      case video.delivery
      when "baseline"
        html5 = %q{<video style="border:1px solid black;width:640px;height:480px" preload="none" controls>}
        vids.each do |v|
        html5 += "<source src=\"#{v}\";" 
        case v
          when /\.ogg/
            html5 += ' type = "video/ogv"'
          when /\.m4v/
            html5 += ' type = "video/mp4"'
          when /\.webm/
            html5 += ' type = "video/webm"'
        end

        html5+=">"
        end
        html5+="</video>"
        raw html5
      else
        raw "<video id=\"theVideo\" controls=\"controls\" height=\"480\" src=\"#{video.url}\" width=\"640\" > </video>"
      end
    end
  end

def  url_to_location(url)
      part=url.split("/")
      host = part[2]
      if host == "s3.amazonaws.com" 
        location = "amazon_s3_redirect"
        bucket = part[3]
        file = part[4]
      else
        location = "url_redirect"
        bucket = ""
        file = part[3..-1].join("/")
      end
      return location,host,bucket,file 
end

end

