clc;
clear;
tic
dx=0.01;
x1=-4:dx:4;
x2=x1;
mu1=gpuArray(zeros(length(x1),length(x2)));
mu2=mu1;
for sigx=1;
    phi=0;
    nn=0:100;
    mm=0:100;
    betavec=0;
    tm_info=zeros(size(betavec));
    bn=1;
    for beta=betavec
        px1=(1/sqrt(2*pi*sigx)).*exp((-x1.^2)/(2*sigx));
        px2=px1.';
        px=px2*px1;

        x1i=1;
        for x11=x1
            x2i=1;
            for x21=x2
                mu1(x1i,x2i)=((x11^2+beta^2+x21^2)/2)+(beta)*(x11*cos(phi)+x21*sin(phi));
                mu2(x1i,x2i)=((x11^2+beta^2+x21^2)/2)-(beta)*(x11*cos(phi)+x21*sin(phi));
                x2i=x2i+1;
            end
            x1i=x1i+1;
        end



        m_info2=0;
        for n=nn
            p_y1x=(exp(-mu1).*mu1.^n)/factorial(n);
            m_info1=0;
            for m=mm
                p_y2x=(exp(-mu2).*mu2.^m)/factorial(m);
                p_xy1y2=px.*p_y1x.*p_y2x;
                py1y2=nansum(nansum(p_xy1y2))*dx^2;
                m_info=p_xy1y2.*log2((p_y1x.*p_y2x)/py1y2);
                m_info1=nansum(nansum(m_info))*dx^2+m_info1;
            end
            m_info2=m_info1+m_info2
        end
        tm_info(bn)=m_info2
        bn=bn+1;
    end

    toc
    plot(betavec,tm_info)
    xlabel ("\beta");
    ylabel("Mutual Information");
    I= 0.5*log2(1+2*sigx^2);
    hold on
    legend('sigx=1','sigx=2','sigx=3');

end