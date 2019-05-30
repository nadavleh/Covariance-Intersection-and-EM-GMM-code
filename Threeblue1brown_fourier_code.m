x=0:0.001:4;
% y=sin(x)+1;
y_freq=3;
% define the function that is in the video, the freq is half because
% the function is squared .^2, so all the minus nodes goes up 
% so it seems like double the frequency. this is the exact function in the
% video. we need to notice that is the resault we will get the frequency y_freq
% and not y_freq/2 becaus of the trigonometric identity
% cos(x)^2=0.5-0.5*cos(2x) so it is actualy two functions and thats why we
% also have amplotude at freq zero (bias because of the 0.5)!
y=cos(2*pi*(y_freq/2)*x).^2;
% figure(1); clf;
% plot(x,y);

exponent_freq_max=y_freq*1.3;
delta_freq=0.01;

real_c_of_gravity=[];
imag_c_of_gravity=[];
k=0;
for n=0:delta_freq:exponent_freq_max;
    k=k+1;
    roll_freq=n;
    
    wrap_function=exp(-1i*2*pi*roll_freq*x);
    wraped_y=y.*wrap_function;
    diall_magnitude=abs(wraped_y);
    real_axis=diall_magnitude.*cos(2*pi*roll_freq*x);
    imag_axis=diall_magnitude.*sin(2*pi*roll_freq*x);
    figure(2); clf;
    plot(real_axis,imag_axis);
    axis([-2 2 -2 2]);
    xlabel(['Real axis']);
    ylabel(['Imaginary axis']);
    pause(0.03);
    
    real_c_of_gravity(k)=sum(real_axis)/length(x);
%     imag_c_of_gravity(k)=sum(imag_axis)/length(x);
    
    figure(3); clf;
    plot(0:delta_freq:n,real_c_of_gravity);
    xlabel(['frequncy of the wrapping exponent']);
    ylabel(['real (or x) axis center of gravity']);
    axis([0 4 -0.2 0.6]);
    hold on;
end









